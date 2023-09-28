Extension { #name : #ClassAnnouncement }

{ #category : #'*Typer-Inference' }
ClassAnnouncement >> typInfInvalidateIndex [
	
]

{ #category : #'*Typer-Inference' }
ClassAnnouncement >> typInfInvalidatesMethod: aLookup [
	^ aLookup receiver classDescription = self classAffected
]
