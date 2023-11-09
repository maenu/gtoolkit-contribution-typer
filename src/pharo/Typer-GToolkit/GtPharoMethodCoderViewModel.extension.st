Extension { #name : #GtPharoMethodCoderViewModel }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoderViewModel >> typGtRbAst [
	^ coderModel attributes
		at: #typGtContext
		ifPresent: #node
		ifAbsent: [ coderModel rbAST ]
]
