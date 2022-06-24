#INCLUDE 'TOTVS.CH'
#INCLUDE 'PROTHEUS.CH'

/*/{Protheus.doc} User Function FUNCLIST
  (long_description)
  @type  Function
  @author Muriel Santana
  @since 23/06/2022
  @version version
  @param param_name, param_type, param_descr
  @return return_var, return_type, return_description
  @example
  (examples)
  @see (links_or_references)
  /*/
User Function FUNCLIST()
  Local cOptionsList := ''

  cOptionsList := 'Goleiro;'
  cOptionsList += 'Lateral Direito;'
  cOptionsList += 'Lateral Esquerdo;'
  cOptionsList += 'Zagueiro;'
  cOptionsList += 'Volante;'
  cOptionsList += 'Meia;'
  cOptionsList += 'Atacante'
Return cOptionsList
