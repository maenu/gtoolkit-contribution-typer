Extension { #name : #MethodModified }

{ #category : #'*Typer-Inference' }
MethodModified >> typInfInvalidatesMethod: aMethodLookup [

	^ (super typInfInvalidatesMethod: aMethodLookup) or: [ 
		  oldMethod sendsSelector: aMethodLookup selector ]
]
