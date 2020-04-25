<?php

$envs = $_ENV;

$namespaces = ['opcache', 'session', 'bcmath', 'pdo', 'mysqli'];

$out = '';

foreach($envs as $envName => $envValue)
{
  if (strpos($envName, 'PHP_DEFINE_') === 0)
  {
    $envName = str_replace('PHP_DEFINE_', '', $envName);

    $envName = strtolower($envName);

    foreach($namespaces as $namespace)
    {
      if (strpos($envName, $namespace) === 0)
      {
        $envName = strtolower(str_replace($namespace . '_', $namespace . '.', $envName));
        break;
      }
    }

    $out .= $envName . ' = ' . $envValue . PHP_EOL;
  }
}

die($out);
