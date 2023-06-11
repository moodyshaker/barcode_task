import 'package:barcode_task/core/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/action_dialog.dart';
import '../router/router.dart';

class AppProvider extends ChangeNotifier {
  static AppProvider get(context) => Provider.of<AppProvider>(context);

  static AppProvider listenFalse(context) =>
      Provider.of<AppProvider>(context, listen: false);

  List<ProductModel> product = [];

  void addProduct(ProductModel model) {
    product.add(model);
    notifyListeners();
  }

  void increase(ProductModel model) {
    bool show = false;
    if (model.counter < model.quantity) {
      model.counter++;
      notifyListeners();
    } else {
      if (!show) {
        show = true;
        showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) => ActionDialog(
                  content: 'Product already full Do you want to add one more?',
                  approveAction: 'Yes',
                  cancelAction: 'No',
                  onApproveClick: () {
                    model.counter++;
                    notifyListeners();
                    MagicRouter.pop();
                    show = false;
                  },
                  onCancelClick: () {
                    MagicRouter.pop();
                    show = false;
                  },
                ));
      }
    }
  }
}
