Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Typer-GToolkit-Core'
}

{ #category : #styling }
TypGtRbAstStyler >> style: aText ast: anAst [
	text := aText.
	[ self visitNode: coderViewModel typGtRbAst ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil
]
