<?php


return [
    'id'    => 'app-api',
    'basePath'  => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules'   => [
        'v1' => [
            'class' => 'api\modules\v1\Module'
        ]
    ],

    'components' => [
        ''
    ]
];