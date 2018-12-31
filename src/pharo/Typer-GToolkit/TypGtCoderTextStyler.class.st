Class {
	#name : #TypGtCoderTextStyler,
	#superclass : #GtCoderTextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #parsing }
TypGtCoderTextStyler >> parseAndTypeRbAst: aString [
	| ast |
	ast := RBParser parseFaultyMethod: aString.
	ast methodNode
		compilationContext:
			(CompilationContext new
				class: (coder classOrMetaClass ifNil: [ UndefinedObject ]);
				forSyntaxHighlighting: true;
				bindings: Dictionary new;
				requestor: nil).
	ast doSemanticAnalysis.
	[ ast ifNotNil: #typType ]
		on: Error
		do: [ Halt now ].
	^ ast
]

{ #category : #private }
TypGtCoderTextStyler >> privateStyle: aText [
	| ast |
	self
		assert: [ aText asString = coder source or: [ aText asString = coder collapsedEditor text text asString ] ].
	ast := aText asString = coder source
		ifTrue: [ coder refreshRbAst ]
		ifFalse: [ self parseAndTypeRbAst: aText asString ].
	[ self style: aText ast: ast.
	self extraStyle: aText ast: ast ]
		on: Error
		do: [ :ex | ex return ].
	^ aText
]
