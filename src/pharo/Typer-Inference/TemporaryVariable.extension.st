Extension { #name : #TemporaryVariable }

{ #category : #'*Typer-Inference' }
TemporaryVariable >> typInfType: aNode in: aContext [

	aNode isDefinition ifTrue: [ 
		^ (((aNode whoDefines: name) assignmentNodes select: [ :e | 
			    e variable = aNode ]) collect: [ :e | 
			   e value typInfTypeIn: aContext ])
			  ifEmpty: [ aContext nil: aNode ]
			  ifNotEmpty: [ :e | e typInfTypeIn: aContext ] ].
	aNode isWrite ifTrue: [ ^ aNode parent value typInfTypeIn: aContext ].
	^ TypInfTemporaryExecutionOrderVisitor
		  typeOf: aNode
		  in: aContext
]
