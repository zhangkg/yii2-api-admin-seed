<?php
/**
 * v1模块配置文件
 * @author Gene <https://github.com/Talkyunyun>
 */

return [
    'params' => [
        'v1' => '版本1'
    ],
    'components' => [
        'log' => [
            'class' => 'yii\log\Dispatcher',
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class'   => 'yii\log\FileTarget',
                    'levels'  => ['error', 'warning', 'trace' ,'info'],
                    'logVars' => [],
                    'logFile' => '@api/modules/v1/runtime/logs/run_'.date('Y-m-d').'.log'
                ]
            ]
        ]
    ]
];