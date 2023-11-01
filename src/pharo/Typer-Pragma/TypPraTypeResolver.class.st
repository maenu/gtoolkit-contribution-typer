Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Lookup'
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
TypPraTypeResolver >> result: aLookup root: anotherLookup [
	^ aLookup classDescription typPraType
]
