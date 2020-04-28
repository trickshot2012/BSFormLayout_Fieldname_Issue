<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" Async="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <script>
        function ChangeInfo() {
            //
        }
        function onCategoryValidation(s, e) {
            var Category = e.value;
            BsCbfuerMaC.SetEnabled(true);
            if (Category == null)
                return;
            if (Category == "110")
                e.isValid = false;
            if (Category == "30") {
                BsCbfuerMaC.SetValue("7986");
                BsCbfuerMaC.SetEnabled(false);
            }
            if (Category == "102") {
                BsCbfuerMaC.SetValue("7963");
                BsCbfuerMaC.SetEnabled(false);
            }
        }
        function conClick(s, e) {
            var isValid = ASPxClientEdit.ValidateGroup('Validation');
            if (isValid)
                popUpClient.Show();
            e.processOnServer = isValid;
        }
        function OnInit(s, e) {
            RegisterForDragDrop(s);
        }
        function RegisterForDragDrop(s) {
            ASPx.Evt.AttachEventToElement(
                s.GetMainElement(),
                'dragover',
                function (evt) {
                    evt.preventDefault();
                });
            ASPx.Evt.AttachEventToElement(
                s.core.canvasManager.renderer.canvas,
                'drop',
                function (evt) {
                    evt.preventDefault();
                    var point = s.core.canvasManager.getLayoutPoint(evt, false);
                    var hitTestResult = s.core.hitTestManager.calculate(point, __aspxRichEdit.DocumentLayoutDetailsLevel.Character, s.core.model.activeSubDocument);
                    var modelPosition = hitTestResult.getPosition();
                    var interval = new ASPx.Interval();
                    interval.start = modelPosition;
                    interval.length = 0;
                    s.selection.intervals = [interval];
                    var text = evt.dataTransfer.getData('text');
                    s.commands.insertText.execute(text);
                });
        }
    </script>
    <dx:BootstrapFormLayout runat="server" ID="FormLayoutDataBinding">
        <Items>
           <%--  Row 1--%>
            <dx:BootstrapLayoutItem Caption="AAA" Name="BsAAA"  FieldName="GGGGA" ColSpanMd="4">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapTextBox runat="server" ID="BsTb1" ReadOnly="true" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>

           <dx:BootstrapLayoutItem Caption="Kategorie" FieldName="caption_category" ColSpanMd="12">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapComboBox ID="BsCbKategorie" runat="server" EnableClientSideAPI="true" OnInit="BsCbKategorie_Init"
                            TextField="kategorie" ValueField="id" EnableSynchronization="True"
                            IncrementalFilteringMode="StartsWith"  OnSelectedIndexChanged="BsCbKategorie_SelectedIndexChanged">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) { callbackPanelAnimation.PerformCallback(); }" />
                            <Items>
                                <dx:BootstrapListEditItem Text="T0" Value="0">
                                </dx:BootstrapListEditItem>
                                <dx:BootstrapListEditItem Text="T1" Value="1">
                                </dx:BootstrapListEditItem>
                                <dx:BootstrapListEditItem Text="T10" Value="10">
                                </dx:BootstrapListEditItem>
                                <dx:BootstrapListEditItem Text="T12" Value="12">
                                </dx:BootstrapListEditItem>
                                <dx:BootstrapListEditItem Text="T109" Value="109">
                                </dx:BootstrapListEditItem>
                            </Items>
                            <ValidationSettings ValidationGroup="Validation">
                                <RequiredField IsRequired="true" ErrorText="Kategorie ist leer !" />
                                </ValidationSettings>
                            <ClientSideEvents Validation="onCategoryValidation" TextChanged="ChangeInfo" />
                        </dx:BootstrapComboBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>


             <dx:BootstrapLayoutItem ColSpanMd="12" Caption=" " FieldName="caption_cateegory" Visible="true">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapCallbackPanel runat="server" EnableCallbackAnimation="true" ClientInstanceName="callbackPanelAnimation">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <asp:Label ID="LabelInfo" CssClass="text-center" runat="server" Font-Bold="true" ForeColor="blue"></asp:Label><br />
                                    <dx:BootstrapImage ID="BootstrapImageKat" Visible="false" CssClasses-Control="maxImage" runat="server">
                                        <CssClasses Control="maxImage"></CssClasses>
                                    </dx:BootstrapImage>
                                    <dx:BootstrapGridView ID="BootstrapGridViewITCustomFields" Visible="false" OnInitNewRow="BootstrapGridViewITCustomFields_InitNewRow"  KeyFieldName="id" runat="server">
                                        <SettingsPopup>
                                            <HeaderFilter MinHeight="140px"></HeaderFilter>
                                        </SettingsPopup>
                                        <SettingsDataSecurity AllowDelete="True" AllowEdit="True" AllowInsert="True" />
                                        <SettingsBehavior ConfirmDelete="true" />
                                        <Columns>
                                            <dx:BootstrapGridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
                                            </dx:BootstrapGridViewCommandColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Visible="false">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="ticket_temp_id" VisibleIndex="2" ReadOnly="true">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="Nachname" VisibleIndex="3">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="Vorname" VisibleIndex="4">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="Abteilung" VisibleIndex="5">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewTextColumn FieldName="Vorgesetzter" VisibleIndex="6">
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewCheckColumn FieldName="BodeGesamtVerteiler" VisibleIndex="7">
                                            </dx:BootstrapGridViewCheckColumn>
                                        </Columns>
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsDataSecurity AllowInsert="true" AllowDelete="true" />
                                    </dx:BootstrapGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:BootstrapCallbackPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>


            <dx:BootstrapLayoutItem Caption="für MA" ColSpanMd="6">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapComboBox ID="BsCbfuerMa" ClientInstanceName="BsCbfuerMaC" runat="server"
                            TextField="name" ValueField="id" EnableSynchronization="True"
                            IncrementalFilteringMode="StartsWith"
              
                            >
                        </dx:BootstrapComboBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>

</Items>
        </dx:BootstrapFormLayout>
  <%--   <asp:SqlDataSource ID="SqlDataSource_Kategorien" runat="server" ConnectionString="<%$ ConnectionStrings:intranetConnectionString %>" SelectCommand="SELECT * FROM [xxx]  order by ccc">
  
    </asp:SqlDataSource>--%>  
</asp:Content>