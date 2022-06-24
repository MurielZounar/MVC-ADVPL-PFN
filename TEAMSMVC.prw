#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} User Function TEAMSMVC
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
User Function TEAMSMVC()
  Local oBrowse := FWMBrowse():New()
  Private cTitle := "Brasileirão"

  oBrowse:SetAlias("ZZ0")
  oBrowse:SetDescription(cTitle)
  oBrowse:SetMenuDef("TEAMSMVC")
  oBrowse:ACTIVATE()
Return

/*/{Protheus.doc} MenuDef
  (long_description)
  @type  Static Function
  @author Muriel Santana
  @since 23/06/2022
  @version version
  @param param_name, param_type, param_descr
  @return return_var, return_type, return_description
  @example
  (examples)
  @see (links_or_references)
/*/
Static Function MenuDef()
  aRotina := {}

  ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.TEAMSMVC" OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE "Incluir"    ACTION "VIEWDEF.TEAMSMVC" OPERATION 3 ACCESS 0
  ADD OPTION aRotina TITLE "Alterar"    ACTION "VIEWDEF.TEAMSMVC" OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE "Excluir"    ACTION "VIEWDEF.TEAMSMVC" OPERATION 5 ACCESS 0 
Return aRotina

/*/{Protheus.doc} ModelDef
  (long_description)
  @type  Static Function
  @author Muriel Santana
  @since 23/06/2022
  @version version
  @param param_name, param_type, param_descr
  @return return_var, return_type, return_description
  @example
  (examples)
  @see (links_or_references)
/*/
Static Function ModelDef()
  Local oModel := MPFormModel():New("TEAMSM")
  Local oStructZ0 := FwFormStruct(1, "ZZ0")
  Local oStructZ1 := FwFormStruct(1, "ZZ1")
  Local oStructZ2 := FwFormStruct(1, "ZZ2")

  oModel:AddFields("ZZ0MASTER", NIL, oStructZ0)
  oModel:AddGrid("ZZ1DETAIL", "ZZ0MASTER", oStructZ1)
  oModel:AddGrid("ZZ2DETAIL", "ZZ1DETAIL", oStructZ2)
  oModel:SetRelation("ZZ1DETAIL", {{"ZZ1_FILIAL", "FwXFilial('ZZ1')"}, {"ZZ1_TCOD", "ZZ0_COD"}}, ZZ1->(IndexKey(1)))
  oModel:SetRelation("ZZ2DETAIL", {{"ZZ2_FILIAL", "FwXFilial('ZZ2')"}, {"ZZ2_PCOD", "ZZ1_COD"}}, ZZ2->(IndexKey(1)))
  oModel:SetDescription(cTitle)
  oModel:SetPrimaryKey({"ZZ0_COD", "ZZ1_COD", "ZZ2_COD"})
  oModel:GetModel("ZZ0MASTER"):SetDescription("Tabela")
  oModel:GetModel("ZZ1DETAIL"):SetDescription("Jogadores")
  oModel:GetModel("ZZ2DETAIL"):SetDescription("Dados do Jogador")
Return oModel

/*/{Protheus.doc} ViewDef
  (long_description)
  @type  Static Function
  @author Muriel Santana
  @since 23/06/2022
  @version version
  @param param_name, param_type, param_descr
  @return return_var, return_type, return_description
  @example
  (examples)
  @see (links_or_references)
/*/
Static Function ViewDef()
  Local oView := FWFormView():New()
  Local oStructZ0 := FWFormStruct(2, "ZZ0")
  Local oStructZ1 := FWFormStruct(2, "ZZ1")
  Local oStructZ2 := FWFormStruct(2, "ZZ2")
  Local oModel := FWLoadModel("TEAMSMVC")

  oView:SetModel(oModel)
  oView:AddField("VIEW_ZZ0", oStructZ0, "ZZ0MASTER")
  oView:AddGrid("VIEW_ZZ1", oStructZ1, "ZZ1DETAIL")
  oView:AddGrid("VIEW_ZZ2", oStructZ2, "ZZ2DETAIL")
  oView:CreateHorizontalBox("P", 20)
  oView:CreateHorizontalBox("S", 40)
  oView:CreateHorizontalBox("I", 40)
  oView:SetOwnerView("VIEW_ZZ0", "P")
  oView:SetOwnerView("VIEW_ZZ1", "S")
  oView:SetOwnerView("VIEW_ZZ2", "I")
  oView:EnableTitleView("VIEW_ZZ0")
  oView:EnableTitleView("VIEW_ZZ1", "Jogadores", RGB(224, 30, 43))
  oView:EnableTitleView("VIEW_ZZ2", "Dados do Jogador", 0)
Return oView
