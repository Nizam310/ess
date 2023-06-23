import 'package:employee_self_service_flutter/design/pay_roll/pay_roll_provider.dart';
import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class PayRoll extends StatelessWidget {
  const PayRoll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PayRollVm(),
      child: Builder(builder: (context) {
        final list = context.select((PayRollVm value) => value.list);
        final colorScheme = Theme.of(context).colorScheme;
        final style = context.textTheme.bodyMedium
            ?.copyWith(color: colorScheme.onPrimary);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Employee',
                        textAlign: TextAlign.center, style: style)),
                Expanded(
                    child: Text(
                  'Year',
                  textAlign: TextAlign.center,
                  style: style,
                )),
                Expanded(
                    child: Text('BasicSalary',
                        textAlign: TextAlign.center, style: style)),
                Expanded(
                    child: Text(
                  'NetSalary',
                  textAlign: TextAlign.center,
                  style: style,
                )),
              ],
            ).paddingSymmetric(
              vertical: 20,
            ),
            Divider(
              color: colorScheme.onPrimary,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) => _PayRollCard(
                        name: list[index]['name'],
                        year: list[index]['year'],
                        basicSalary: list[index]['basicSalary'],
                        netSalary: list[index]['netSalary'])
                    .paddingSymmetric(vertical: 5),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10, vertical: 10);
      }),
    );
  }
}

class _PayRollCard extends StatelessWidget {
  final String name;
  final String year;
  final String basicSalary;
  final String netSalary;

  const _PayRollCard(
      {Key? key,
      required this.name,
      required this.year,
      required this.basicSalary,
      required this.netSalary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final style =
        context.textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: colorScheme.outline)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 15,
                      ),
                    ),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: style,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Text(
                year,
                textAlign: TextAlign.center,
                style: style,
              )),
              Expanded(
                  child: Text(
                basicSalary,
                textAlign: TextAlign.center,
                style: style,
              )),
              Expanded(
                  child: Text(
                netSalary,
                textAlign: TextAlign.center,
                style: style,
              )),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 10, horizontal: 10),
    );
  }
}
