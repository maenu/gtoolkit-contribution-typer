Class {
	#name : #TypShaBlBlShortcut,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlShortcut class >> shadowedClass [
	^ BlShortcut class
]

{ #category : #accessing }
TypShaBlBlShortcut >> ___action: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {BlElement typAsType}
				result: TypUnknownType new
				argumentsOptional: true ];
		resultType: [ :a :s :r | BlShortcut typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlShortcut >> ___combination: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlKeyCombination typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
