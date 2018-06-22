<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'TEMP_DB_NAME');

/** MySQL database username */
define('DB_USER', 'TEMP_DB_USER');

/** MySQL database password */
define('DB_PASSWORD', 'TEMP_DB_PASSWORD');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Fu;#K`Gvl3{hR4%%`dw%2`AJLTG-bXZ~xHkGX^4=;!W~z{fD4(}9L;%[@Pg4,[N}');
define('SECURE_AUTH_KEY',  'wTqo<Zf!b8G5ylzSsywF4+szdkWADnJ#jb:prbgK=I.x!4?G!:jz9QkONr[:fk])');
define('LOGGED_IN_KEY',    '7G6}XMOmmhKh<vVA>3qs{2oSv^?3`6>!r*L=}X%Y8XjwH/[,dzTz_!npJR!EwHA5');
define('NONCE_KEY',        '4VMF-g)0!,^QDx{$FKON$cAm,lR_B?na^ HRC6L ^a~KM%Ey_mWV}7f,qP X0E81');
define('AUTH_SALT',        '=TW=,yW4R?IWyh]X+h{INW2Pu<]X^e>GMvv?t)W>lcFp5f0d&W1tVD<~pT[L<m?b');
define('SECURE_AUTH_SALT', 't.L/q1TzlWY&}[Y5tWo^p?q(=6X?U8Sug&u$dM$nRA,Vo1pM `@M%54xKQ16b{ -');
define('LOGGED_IN_SALT',   'v<E!)?/Hb.W}l?;6Uwve@pirc;sXCurz}w E.&=r)/PPW)?0AwvZ{.m|3H(|a4}|');
define('NONCE_SALT',       '@h>(JU`]^#?qWYu6>ahxXx{CG-/4xEEz*Xn@eOy>~-HF-6cT`ouou!=?h{VGGH&l');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

