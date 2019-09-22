<?php

function str_replace_array($arr, $key, $value)
{
    $keys = array_keys($arr);
    array_walk(
        $keys,
        function (&$item) use ($key, $value) {
            $item = str_replace($key, $value, $item);
        }
    );
    array_walk(
        $arr,
        function (&$item) use ($key, $value) {
            if (is_array($item)) {
                $item = str_replace_array($item, $key, $value);
            }
            $item = str_replace($key, $value, $item);
        }
    );
    return array_combine($keys, $arr);
}

$datas = [
    'aasd' => 'bbsr',
    'aas' => [
        'zzc' => 'ffts'
    ]
];

$key = 's';
$value = '%SUPER%';

$datas = str_replace_array($datas, $key, $value);

print_r($datas);


