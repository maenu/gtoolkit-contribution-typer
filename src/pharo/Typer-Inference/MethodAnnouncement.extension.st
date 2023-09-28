Extension { #name : #MethodAnnouncement }

{ #category : #'*Typer-Inference' }
MethodAnnouncement >> typInfInvalidateIndex [
	
]

{ #category : #'*Typer-Inference' }
MethodAnnouncement >> typInfInvalidatesMethod: aLookup [
	^ (aLookup receiver classDescription = method methodClass
		and: [ aLookup selector = method selector ])
		or: [ method sendsSelector: aLookup selector ]
]

{ #category : #'*Typer-Inference' }
MethodAnnouncement >> typInfInvalidatesVariable: aVariableLookup [

	^ (aVariableLookup receiver classDescription = method methodClass and: [ 
		   aVariableLookup selector = method selector ]) or: [ 
		  method sendsSelector: aVariableLookup selector ]
]
