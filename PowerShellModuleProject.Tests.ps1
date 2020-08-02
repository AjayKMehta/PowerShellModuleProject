Install-Module -Name PSScriptAnalyzer -Force

describe 'Module-level tests' {

    it 'the module imports successfully' {
        { Import-Module -Name "$PSScriptRoot\PowerShellModuleProject.psm1" -ErrorAction Stop } | Should -Not -Throw
    }

    it 'the module has an associated manifest' {
        Test-Path "$PSScriptRoot\PowerShellModuleProject.psd1" | Should -Be $true
    }

    it 'passes all default PSScriptAnalyzer rules' {
        Invoke-ScriptAnalyzer -Path "$PSScriptRoot\PowerShellModuleProject.psm1" | Should -BeNullOrEmpty
    }

}