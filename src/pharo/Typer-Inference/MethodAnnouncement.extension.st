Extension { #name : #MethodAnnouncement }

{ #category : #'*Typer-Inference' }
MethodAnnouncement >> typInfInvalidatesMethod: aMethodLookup [

	^ (aMethodLookup receiver classDescription = method methodClass and: [ 
		   aMethodLookup selector = method selector ]) or: [ 
		  method sendsSelector: aMethodLookup selector ]
]

{ #category : #'*Typer-Inference' }
MethodAnnouncement >> typInfInvalidatesVariable: aVariableLookup [

	^ (aVariableLookup receiver classDescription = method methodClass and: [ 
		   aVariableLookup selector = method selector ]) or: [ 
		  method sendsSelector: aVariableLookup selector ]
]
