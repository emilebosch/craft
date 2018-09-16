<?php
$databaseUrl = parse_url(getenv('DATABASE_URL'));

return array(
  'server' => $databaseUrl['host'],
  'port' => $databaseUrl['port'],
  'user' => $databaseUrl['user'],
  'password' => $databaseUrl['pass'],
  'database' => substr($databaseUrl['path'], 1),
  'tablePrefix' => 'craft'
);