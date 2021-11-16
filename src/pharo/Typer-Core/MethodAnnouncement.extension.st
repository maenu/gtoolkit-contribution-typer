Extension { #name : #MethodAnnouncement }

{ #category : #'*Typer-Core' }
MethodAnnouncement >> typInvalidates: aLookupOrType [

	^ aLookupOrType isInvalidatedByMethodAnnouncement: self
]
