Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeResolver >> canResolve: aLookup [
	^ aLookup classDescription typPraHasType
]

{ #category : #printing }
TypPraTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'pra type'
]

{ #category : #accessing }
TypPraTypeResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ aLookup classDescription typPraType
]
