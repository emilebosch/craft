<?php
$databaseUrl = parse_url(getenv('DATABASE_URL'));

return [
    'driver' => 'pgsql',
    'server' => $databaseUrl['host'],
    'user' =>  $databaseUrl['user'],
    'password' => $databaseUrl['pass'],
    'database' => substr($databaseUrl['path'], 1),
    'schema' => 'public',
    'tablePrefix' => '',
    'port' => $databaseUrl['port']
];
?>