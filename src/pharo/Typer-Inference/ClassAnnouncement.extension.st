Extension { #name : #ClassAnnouncement }

{ #category : #'*Typer-Inference' }
ClassAnnouncement >> typInfInvalidatesMethod: aMethodLookup [

	^ aMethodLookup receiver classDescription = self classAffected
]
