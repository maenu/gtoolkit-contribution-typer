Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ TypShaIndex instance canResolveMethod: aLookup
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> result: aLookup root: anotherLookup [
	^ TypShaIndex instance resultMethod: aLookup root: anotherLookup
]
