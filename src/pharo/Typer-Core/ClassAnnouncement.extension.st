Extension { #name : #ClassAnnouncement }

{ #category : #'*Typer-Core' }
ClassAnnouncement >> typInvalidates: aLookupOrType [

	^ aLookupOrType isInvalidatedByClassAnnouncement: self
]
