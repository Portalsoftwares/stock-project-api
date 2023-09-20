<?php

return [
    'mode'                  => 'utf-8',
    'format'                => 'A4',
    'margin_top'            => '40px',
    'author'                => 'FaceAzur Online',
    'subject'               => '',
    'keywords'              => '',
    'creator'               => 'FaceAzure Online',
    'display_mode'          => 'fullpage',
    'tempDir'               => base_path('../temp/'),
    'pdf_a'                 => false,
    'pdf_a_auto'            => false,
    'table_error_report' => false,
    'icc_profile_path'      => '',
    'font_path' => base_path('resources/font/'),
    'template_path' => 'pdf',
    'font_data' => [
        'khmerossiemreap' => [
            'R'  => 'KhmerOSsiemreap.ttf',    // regular font
            'useOTL' => 0xFF,    // required for complicated langs like Persian, Arabic, Khmer and Chinese
            'useKashida' => 75,  // required for complicated langs like Persian, Arabic, Khmer and Chinese
        ],
        'khmerosbattambang' => [
            'R'  => 'KhmerOSbattambang.ttf',    // regular font
            'useOTL' => 0xFF,    // required for complicated langs like Persian, Arabic, Khmer and Chinese
            'useKashida' => 75,  // required for complicated langs like Persian, Arabic, Khmer and Chinese
        ],
        'khmerosmuol' => [
            'R'  => 'KhmerOSmuol.ttf',    // regular font
            'useOTL' => 0xFF,    // required for complicated langs like Persian, Arabic, Khmer and Chinese
            'useKashida' => 75,  // required for complicated langs like Persian, Arabic, Khmer and Chinese
        ],
        'khmerosmuollight' => [
            'R'  => 'KhmerOSmuollight.ttf',    // regular font
            'useOTL' => 0xFF,    // required for complicated langs like Persian, Arabic, Khmer and Chinese
            'useKashida' => 75,  // required for complicated langs like Persian, Arabic, Khmer and Chinese
        ],
        "roboto" => [
            'R' => "Roboto-Regular.ttf",
            'B' => "Roboto-Medium.ttf",
            'I' => "Roboto-Italic.ttf",
            'BI' => "Roboto-MediumItalic.ttf",
        ],
        "cour" => [
            'R' => "cour.ttf", // regular font
        ]
    ]
];
