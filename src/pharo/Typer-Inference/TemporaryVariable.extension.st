Extension { #name : #TemporaryVariable }

{ #category : #'*Typer-Inference' }
TemporaryVariable >> typInfTypeRecursiveIn: aNode self: aType [

	aNode isDefinition ifTrue: [ 
		^ (((aNode whoDefines: name) assignmentNodes select: [ :e | 
			    e variable = aNode ]) collect: [ :e | 
			   e value typInfTypeSelf: aType ])
			  ifEmpty: [ aNode typInfNilSelf: aType ]
			  ifNotEmpty: [ :e | e typInfTypeSelf: aType ] ].
	aNode isWrite ifTrue: [ ^ aNode parent value typInfTypeSelf: aType ].
	^ TypInfTemporaryExecutionOrderVisitor
		  typeForTemporary: aNode
		  self: aType
]
