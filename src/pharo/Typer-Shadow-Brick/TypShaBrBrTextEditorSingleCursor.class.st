Class {
	#name : #TypShaBrBrTextEditorSingleCursor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorSingleCursor class >> shadowedClass [
	^ BrTextEditorSingleCursor class
]

{ #category : #shadow }
TypShaBrBrTextEditorSingleCursor >> mPosition: aLookup [
	<typShaMethod: 'position'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
