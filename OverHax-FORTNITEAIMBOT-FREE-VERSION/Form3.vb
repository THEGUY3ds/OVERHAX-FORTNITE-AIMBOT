Public Class Form3
    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        Dim strOutputDirectory As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)
        Dim dir As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim filename As String = dir + "aim.exe"
        IO.File.WriteAllBytes(filename, My.Resources.aim)
        Process.Start(filename)
    End Sub

    Private Sub CheckBox7_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox7.CheckedChanged
        Dim dir As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim filename As String = dir + "recoil.exe"
        IO.File.WriteAllBytes(filename, My.Resources.recoil)
        Process.Start(filename)
    End Sub

    Private Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox3.Checked = True Then
            CrossHair.Show()
            Crosshair1.Show()
        Else
            If CheckBox3.Checked = False Then
                Crosshair1.Close()
                CrossHair.Close()
            End If

        End If
    End Sub

    Private Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged
        Dim dir As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim filename As String = dir + "Xp0B0T.exe"
        IO.File.WriteAllBytes(filename, My.Resources.Xp0B0T)
        Process.Start(filename)
    End Sub

    Private Sub CheckBox4_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox4.CheckedChanged
        Dim dir As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim filename As String = dir + "autobuild.exe"
        IO.File.WriteAllBytes(filename, My.Resources.autobuild)
        Process.Start(filename)
    End Sub

    Private Sub CheckBox5_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox5.CheckedChanged
        Dim dir As String = My.Computer.FileSystem.SpecialDirectories.Temp
        Dim filename As String = dir + "G0STP3AK.exe"
        IO.File.WriteAllBytes(filename, My.Resources.G0STP3AK)
        Process.Start(filename)
    End Sub
    Private Sub Form3_KeyDown(sender As Object, e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyDown
        If e.KeyCode = Keys.Insert Then
            Me.Close()
        End If
    End Sub
End Class