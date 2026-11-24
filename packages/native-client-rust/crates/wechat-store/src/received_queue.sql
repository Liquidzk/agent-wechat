-- Only the two fixed ASCII queue prefixes ending in ':' use this statement.
-- In the key's BINARY order, ';' immediately follows ':'. Both bounds
-- depend only on the parameter, so SQLite can seek in the primary-key index.
SELECT key, value
FROM runtime
WHERE key >= ?1 AND key < (substr(?1, 1, length(?1) - 1) || ';')
ORDER BY key
LIMIT ?2
