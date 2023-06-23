import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/documents/documents_provider.dart';
import 'package:employee_self_service_flutter/design/documents/widgets/front_and_back_image_widget.dart';
import 'package:employee_self_service_flutter/design/documents/widgets/front_only_image_widget.dart';
import 'package:employee_self_service_flutter/design/documents/widgets/image_viewing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttachDocuments extends StatefulWidget {
  const AttachDocuments({Key? key}) : super(key: key);

  @override
  State<AttachDocuments> createState() => _AttachDocumentsState();
}

class _AttachDocumentsState extends State<AttachDocuments> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DocumentsVm(),
        child: Consumer<DocumentsVm>(builder: (context, data, _) {
          return data.haveData == true
              ? ListView(
                  children: [
                    Column(
                      children: data.listFrontAndBack.map((list) {
                        return FrontAndBackFiles(
                          trailing: Visibility(
                            visible:list.save==true,
                            child: SizedBox(
                              width: 60,
                              height: 30,
                              child: CusButton(
                                text: 'Save',
                                onTap: () {
                                  data.onSaveFrontAndBackImage(list);
                                  data.refresh();
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          onClearFront: () {
                            data.refresh();
                            setState(() {
                              list.frontImage = null;
                            });
                          },
                          onClearBack: () {
                            data.refresh();
                            setState(() {
                              list.backImage = null;
                            });
                          },
                          title: list.docName.toString(),
                          frontImage: list.frontImage,
                          backImage: list.backImage,
                          onTapFront: () {
                            if (context.read<DocumentsVm>().saveClicked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => ImageViewingPage(
                                    file: list.frontImage,
                                    title: list.docName.toString(),
                                    ctx: context,
                                    isFront: true,
                                    model: list,
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (builder) => AlertDialog(
                                  title: const Text('Save Image First!'),
                                  actions: [
                                    CusButton(
                                      text: 'Cancel',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          onTapBack: () {
                            if (list.save==false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => ImageViewingPage(
                                    file: list.backImage,
                                    title: list.docName.toString(),
                                    ctx: context,
                                    isFront: false,
                                    model: list,
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (builder) => AlertDialog(
                                  title: const Text('Save image first!'),
                                  actions: [
                                    CusButton(
                                      text: 'Cancel',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          attachFront: () {
                            data.pickFile(list, isFront: true);
                            data.refresh();
                            setState(() {});
                          },
                          attachBack: () {
                            data.pickFile(list, isFront: false);
                            data.refresh();
                            setState(() {});
                          },
                        );
                      }).toList(),
                    ),
                    Column(
                      children: data.list.map((list) {
                        return FrontOnly(
                          title: list.docName.toString(),
                          image: list.frontImage,
                          trailing: Visibility(
                            visible:list.save==true,
                            child: SizedBox(
                              width: 60,
                              height: 30,
                              child: CusButton(
                                text: 'Save',
                                onTap: () {
                                  data.onSaveFrontAndBackImage(list);
                                  data.refresh();
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          onTapAttach: () {
                            data.pickFile(list, isFront: true);
                            data.refresh();
                          },
                          onClear: () {
                            list.frontImage = null;
                            data.refresh();
                          },
                          onSave: () {
                            data.onSaveImage();
                            data.refresh();
                          },
                          onTapImage: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => ImageViewingPage(
                                  file: list.frontImage,
                                  title: list.docName.toString(),
                                  model: list,
                                  ctx: context,
                                  isFront: true,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CusButton(
                        onTap: () {
                          data.haveData = true;
                          data.refresh();
                        },
                        text: 'Click to attach documents'),
                  ],
                );
        }));
  }
}
