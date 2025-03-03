import 'dart:ffi';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class ScaledGrid extends StatelessWidget {
  final ValueNotifier<List<int>> items;

  /// Relative spacing as a fraction of the cell side (e.g., 0.15 = 15%)
  final double relativeSpacing;

  /// Fractional padding for the text inside each cell (e.g., 0.10 = 10%)
  final double textPaddingFactor;

  const ScaledGrid({
    Key? key,
    required this.items,
    this.relativeSpacing = 0.15,
    this.textPaddingFactor = 0.10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<int>>(
      valueListenable: items,
      builder: (context, itemList, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final int totalItems = itemList.length;

            double bestCellSide = 0;
            int bestColumns = 1;
            int bestRows = totalItems;

            for (int cols = 1; cols <= totalItems; cols++) {
              final int rows = ((totalItems + cols - 1) / cols).ceil();

              final double possibleCellWidth =
                  constraints.maxWidth / (cols + (cols - 1) * relativeSpacing);
              final double possibleCellHeight =
                  constraints.maxHeight / (rows + (rows - 1) * relativeSpacing);
              final double possibleCellSide =
                  math.min(possibleCellWidth, possibleCellHeight);

              if (possibleCellSide > bestCellSide) {
                bestCellSide = possibleCellSide;
                bestColumns = cols;
                bestRows = rows;
              }
            }

            // Calculate the actual spacing based on the optimal cell.
            final double spacing = bestCellSide * relativeSpacing;

            return Center(
              child: Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: itemList.map((item) {
                  return SizedBox(
                    width: bestCellSide,
                    height: bestCellSide,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const RadialGradient(
                          center: Alignment(-0.3, -0.3),
                          radius: 0.8,
                          colors: [
                            Color(0xFFFF3B3B),
                            Color(0xFFB22222),
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.all(bestCellSide * textPaddingFactor),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              item.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
