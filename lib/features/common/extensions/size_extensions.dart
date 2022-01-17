
import '../pageutil/pageutil.dart';

///define size for screen (width, height and sp for fonts)
extension SizeExtension on num {
  num get w => PageUtil().setWidth(this);

  num get h => PageUtil().setHeight(this);

  num get sp => PageUtil().setSp(this);
}
