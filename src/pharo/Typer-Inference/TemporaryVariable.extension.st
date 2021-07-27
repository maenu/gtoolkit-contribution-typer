Extension { #name : #TemporaryVariable }

{ #category : #'*Typer-Inference' }
TemporaryVariable >> typInfTypeRecursiveIn: aNode [

	aNode isDefinition ifTrue: [ 
		^ (((aNode whoDefines: name) assignmentNodes select: [ :e | 
			    e variable = aNode ]) collect: [ :e | e value typInfType ])
			  ifEmpty: [ self typInfNil ]
			  ifNotEmpty: #typAsType ].
	aNode isWrite ifTrue: [ ^ aNode parent value typInfType ].
	^ TypInfTemporaryExecutionOrderVisitor typeForTemporary: aNode
]
