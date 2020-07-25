Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System.Data

Public Class BaseCode
    Sub MOSendCDOEmail(ByVal MOSubject As String, ByVal MOBody As String, ByVal MOSendTo As String, ByVal MOFrom As String, Optional ByVal type As Integer = 1)
        Dim MOiMsg As Object
        Dim MOiConf As Object
        Dim moflds As Object

        If MOFrom Is Nothing Then
            MOFrom = "ajain213@csc.com"
        End If
        MOiMsg = CreateObject("CDO.Message")
        MOiConf = CreateObject("CDO.Configuration")
        MOiConf.Load(-1) ' CDO Source Defaults
        moflds = MOiConf.Fields
        With moflds
            .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
            .Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "RELAY.CSC.COM"
            .Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
            .Update()
        End With


        With MOiMsg
            .Configuration = MOiConf
            .To = MOSendTo
            .From = MOFrom
            .Subject = MOSubject
            If type = 2 Then
                .HTMLBody = MOBody

            Else
                .TextBody = MOBody

            End If

            .Send()
        End With
        MOiMsg = Nothing
        MOiConf = Nothing
    End Sub
    Public Enum LeaveStatus As Integer
        Applied = 1
        cancel = 3
        Approve = 2

    End Enum

    Public Sub GetAutoLeave()

        Dim adp As OleDbDataAdapter
        dtEmp = New DataTable
        Dim sql As String
        Dim dbconn As OleDbConnection
        dbconn = New OleDbConnection()
        dbconn.ConnectionString = ConnectionString
        dbconn.Open()
        'sql = "SELECT [FromDate], [ToDate], [Comments], [Status], [ID] FROM [LeaveRecord] WHERE (([EmpNo] =" + txtEmpNo.Text + ") AND ([Status] = True))"
        sql = "SELECT EmpName,EmailID, EmpNo from EmpDetails where ismanager =true"
        adp = New OleDbDataAdapter(sql, dbconn)
        adp.Fill(dtEmp)
        sql = ""
        Dim dt As String = DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString() + "-" + DateTime.Now.Year.ToString()
        For Each dtrow As DataRow In dtEmp.Rows
            sql = "SELECT EmpDetails.EmpName, LeaveRecord.FromDate, LeaveRecord.ToDate, LeaveRecord.Comments, EmpDetails.EmailID, EmpDetails.ManagerEmailID FROM EmpDetails INNER JOIN LeaveRecord ON EmpDetails.EmpNo=LeaveRecord.EmpNo WHERE ((([EmpDetails.ManagerEmailID])=""" + dtrow("EmailID") + """) And ((LeaveRecord.status)<>3)and  (datediff(""d"",Format(CDate(""" + dt + """),""mm-dd-yyyy""),Format(CDate([FromDate]),""mm-dd-yyyy""))=3) )"
            dtEmpleave = New DataTable
            adp = New OleDbDataAdapter(sql, dbconn)
            adp.Fill(dtEmpleave)
            For Each dtLeave As DataRow In dtEmpleave.Rows
                MOSendCDOEmail("Reminder: Planned Leave From " + dtLeave.Item("FromDate") + " TO " + dtLeave.Item("ToDate") + "Auto Process", dtLeave.Item("Comments"), dtLeave("ManagerEmailID"), dtLeave("EmailId"))
            Next
        Next

        ''query need to change
        dtEmpleave.Dispose()
        dtEmp.Dispose()
        dbconn.Close()

    End Sub

 
    Private dtEmp As DataTable
    Private dtEmpleave As DataTable
    Private ConnectionString As String = System.Configuration.ConfigurationManager.AppSettings("ConnString")

End Class
