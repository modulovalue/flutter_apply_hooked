import 'package:flutter_apply_hooked/flutter_apply_hooked.dart';
import 'package:single_bloc_base/single_bloc_base.dart';

T $$$<T extends BlocBase>(T Function() bloc, {List<Object> keys}) =>
    useDispose(bloc, (a) => a.dispose(), keys: keys);
