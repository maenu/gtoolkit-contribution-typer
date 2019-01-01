Class {
	#name : #TypShaBlBlKeyCombination,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #accessing }
TypShaBlBlKeyCombination class >> ___builder [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlKeyCombinationBuilder typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombination class >> shadowedClass [
	^ BlKeyCombination class
]
