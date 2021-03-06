#' Get live births data for municipalities
#'
#' This function retrieves live births data from PCDaS ElasticSearch cluster for a specified year.
#'
#' This function uses raw data from the Sistema de Informações de Nascidos Vivos (SINASC) available at the PCDaS ElasticSearch cluster. A documentation about this data can be found at \url{https://bigdata-metadados.icict.fiocruz.br/dataset/sistema-de-informacoes-de-nascidos-vivos-sinasc}.
#'
#' @param conn Connection object created with \code{\link{pcdas_connect}}.
#' @param ano numeric. Year of birth.
#' @param agg string. Agregation level. 'mun' for municipalities, 'uf' for "unidades federativas" or 'regsaude' for "regiões de saúde".
#'
#' @return A \code{data.frame} containing number of live births (\code{sinasc}) for the aggregation level.
#' @examples
#' sinasc <- get_sinasc_mun(conn = conn, ano = 2010, agr = "mun")

get_sinasc <- function(conn, ano, agr){

  query <- paste0("ano_nasc:", ano)

  if(agr == "mun"){
    q_body <- agg_sinasc_mun
    df_names <- c("cod_mun", "sinasc")
  } else if (agr == "uf"){
    q_body <- agg_sinasc_uf
    df_names <- c("uf", "sinasc")
  } else if (agr == "regsaude"){
    q_body <- agg_sinasc_regsaude
    df_names <- c("cod_reg_saude", "sinasc")
  }

  sinasc <- elastic::Search(conn, index="datasus-sinasc-dss",
                body = q_body,
                q = query,
                asdf = TRUE)

  sinasc <- sinasc$aggregations$a1$buckets
  names(sinasc) <- df_names

  return(sinasc)

}
