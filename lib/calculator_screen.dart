import 'package:flutter/material.dart';
import 'package:lot_size_calculator/buttons.dart';
import 'package:lot_size_calculator/spacing.dart';
import 'package:lot_size_calculator/text_fields.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pipVal = TextEditingController();
  final _amount = TextEditingController();
  final _stopLoss = TextEditingController();
  double _lotSize = 0;

  @override
  void dispose() {
    _pipVal.dispose();
    _amount.dispose();
    _stopLoss.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Lot Size Calculator",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "Amount to Risk (\$)",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const XMargin(25),
                  Flexible(
                    flex: 3,
                    child: AppTextField(
                      controller: _amount,
                      validator: (val) => val == null || val.isEmpty
                          ? "Amount must not be empty"
                          : null,
                    ),
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "Stop loss",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const XMargin(25),
                  Flexible(
                    child: AppTextField(
                      controller: _stopLoss,
                      validator: (val) => val == null || val.isEmpty
                          ? "Stop loss must not be empty"
                          : null,
                    ),
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "PIP value per lot",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const XMargin(25),
                  Flexible(
                    child: AppTextField(
                      controller: _pipVal,
                    ),
                  ),
                ],
              ),
              const YMargin(25),
              Center(
                child: CustomButton(
                  text: "Calculate",
                  function: _onCalculateTap,
                ),
              ),
              const YMargin(25),
              Expanded(
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Lot Size",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const YMargin(30),
                        Text(
                          _lotSize.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCalculateTap() {
    if (!_formKey.currentState!.validate()) return;
    if (_pipVal.text.isEmpty) {
      _lotSize = LotSizeCalculations.twoVarCalc(
        double.parse(_amount.text),
        double.parse(_stopLoss.text),
      );
    } else {
      _lotSize = LotSizeCalculations.threeVarCalc(
        double.parse(_amount.text),
        double.parse(_stopLoss.text),
        double.parse(_pipVal.text),
      );
    }
    setState(() {});
  }
}

class LotSizeCalculations {
  /// The three variable calculation takes in two variables:
  /// 1. Amount to Risk, A
  /// 2. Stop loss pips, S
  /// And the calculation gives the lot size(L) as the result of the calculation
  static double twoVarCalc(double A, double S) {
    return A / (S * 10);
  }

  /// The three variable calculation takes in three variables:
  /// 1. Amount to Risk, A
  /// 2. Stop loss pips, S
  /// #. Pip value per loss, P
  /// And the calculation gives the lot size(L) as the result of the calculation
  static double threeVarCalc(double A, double S, double P) {
    return A / (S * P);
  }
}
