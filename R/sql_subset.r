
################################################################
# name:sqlquery_select
# TODO add argument to ignore_geom ie:

sql_subset <- function(conn, x, subset = NA, select = "*",
                            limit = -1, eval = FALSE, check = T)
{
  # assume ch exists
  if(length(grep("\\.",x)) == 0)
    {
      schema <- "public"
      table <- x
    } else {
      schema <- strsplit(x, "\\.")[[1]][1]
      table <- strsplit(x, "\\.")[[1]][2]
    }


  if(check)
    {
    exists <- pgListTables(conn, schema, table)
    if(nrow(exists) == 0)
    {
      stop("Table doesn't exist.")
    }

    }


  if(check & select=="*")
    {
      select <- names(
                     dbGetQuery(conn,
                      paste("select ", select, " from ",
                      schema, ".",
                      table, " limit 1",
                      sep = ""))
                     )
      # remove any geometry column
      indexValue <- which(select == 'the_geom')
      if(length(indexValue) > 0)
        {
          select <- select[-indexValue]
        }

      indexValue <- which(select == 'geom')
      if(length(indexValue) > 0)
        {
          select <- select[-indexValue]
        }
      select <- paste(select, collapse = ", ", sep = "")

      }

  sqlquery <- paste("select ", select, "\nfrom ", schema, ".",
                    table, "\n",
                    sep = "")

  if(!is.na(subset))
    {
      sqlquery <- paste(sqlquery, "where ", subset, "\n", sep = "")
    }

  if(limit > 0)
    {
      sqlquery <- paste(sqlquery, "limit ", limit, "\n", sep = "")
    }

  if(eval)
    {
      dat <- dbGetQuery(conn,sqlquery)
      return(dat)
    } else {
      return(sqlquery)
    }


}
