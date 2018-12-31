Class {
	#name : #TypGtCoderTextStyler,
	#superclass : #GtCoderTextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #private }
TypGtCoderTextStyler >> privateStyle: aText [
	self assert: [ aText asString = coder source or: [ aText asString = coder collapsedEditor text text asString ] ].
	[ | ast |
	ast := coder refreshRbAst.
	self style: aText ast: ast.
	self extraStyle: aText ast: ast ]
		on: Error
		do: [ :ex | ex return ].
	^ aText
]
