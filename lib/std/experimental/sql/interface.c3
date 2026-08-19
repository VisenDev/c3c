module std::experimental::sql;

typedef ParamIndex = int;
typedef ColummIndex = int;

interface Statement
{
    fn void? bind_bool(ParamIndex index, bool value);
    fn void? bind_int(ParamIndex index, int value);
    fn void? bind_long(ParamIndex index, long value);
    fn void? bind_float(ParamIndex index, float value);
    fn void? bind_double(ParamIndex index, double value);
    fn void? bind_string(ParamIndex index, String value);
    fn void? bind_bytes (ParamIndex index, void * addr, isz size);
    fn void? reset();
    fn void deinit();
    fn void? step();
    fn bool? column_bool(ColumnIndex index);
    fn int? column_int(ColumnIndex index);
    fn long? column_long(ColumnIndex index);
    fn float? column_float(ColumnIndex index);
    fn double? column_double(ColumnIndex index);
    fn String? column_string(ColumnIndex index);
    fn void? column_bytes (ColumnIndex index, void ** out, isz * outlen);
}

interface Driver
{
    fn Statement? prepare(String sql);
    fn void deinit();
}
