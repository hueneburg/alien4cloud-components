# Which extension for PostgreSQL to handle scaling? -- Pgpool-II

* Status: accepted
* Deciders: Armin Hüneburg
* Date: 2018-08-22

## Context and Problem Statement

There are multiple extensions for handling scaling in PostgreSQL databases. 
Each extension handles scaling, replication and such a little bit different.
So, the question is which one to choose?

## Considered Options

* Pgpool-II
* Pgpool-I
* PgCluster
* slony
* Bucardo
* Londiste
* Mammoth
* rubyrep
* Bi-Directional Replication
* pg_shard
* pglogical
* Postgres-XL
* Citus

## Decision Outcome

Chosen option: "Pgpool-II", because it offered all positive effects as described here 
https://wiki.postgresql.org/wiki/Replication,_Clustering,_and_Connection_Pooling.
It is also free and had the best documentation compared to the rest.

### Positive Consequences

* Best documentation
* Free

### Negative consequences

* Limited Support

## Pros and Cons of the Options

Only consider free extensions that offer all benefits as described here: 
https://wiki.postgresql.org/wiki/Replication,_Clustering,_and_Connection_Pooling.

### Pgpool-II

* Pro: Good Documentation
* Pro: Free
* Con: Limited Support

### Postgres-XL

* Pro: Free
* Con: Documentation worse than Pgpool-II
* Con: Limited Support

### Citus

* Pro: Support
* Pro: Good Documentation
* Con: Not free
