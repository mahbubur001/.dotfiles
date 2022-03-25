<?php
// https://cs.symfony.com/doc/rules/

use PhpCsFixer\Config;
use PhpCsFixer\Finder;

$finder = Finder::create()
  ->exclude(['bootstrap', 'node_modules', 'public', 'storage', 'vendor'])
  ->notPath('*')
  ->in(__DIR__);

$rules = [
	'@Symfony'               => true,
	'array_indentation'      => true,
	'binary_operator_spaces' => [
		'operators' => [
			'=>' => 'align',
			'='  => 'align',
		],
	],
	'blank_line_after_opening_tag' => false, // <?php tag
	'increment_style'              => ['style' => 'post'],
	'linebreak_after_opening_tag'  => false, // <?php tag

	//   'align_multiline_comment' => [
	// 	'comment_type' => 'all_multiline',
	//   ],
	'php_unit_dedicate_assert'                      => ['target' => '5.6'],
	//   'phpdoc_no_empty_return'                        => false,
	//   'phpdoc_to_comment'                             => false,
	'single_line_comment_style'                     => [
		'comment_types' => ['asterisk', 'hash'],
	],
];

return (new Config())
  ->setFinder($finder)
  ->setIndent("\t")
  ->setLineEnding("\n")
  ->setRules($rules)
  ->setRiskyAllowed(true)
  ->setUsingCache(true);
