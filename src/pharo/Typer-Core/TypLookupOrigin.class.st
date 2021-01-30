Class {
	#name : #TypLookupOrigin,
	#superclass : #Object,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupOrigin >> isLookup [
	^ false
]

{ #category : #accessing }
TypLookupOrigin >> isNil [
	^ false
]

{ #category : #accessing }
TypLookupOrigin >> isNode [
	^ false
]

{ #category : #accessing }
TypLookupOrigin >> rootOr: aLookup [
	^ aLookup
]
