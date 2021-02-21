Class {
	#name : #TypShaBlBlKeyCombination,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #shadow }
TypShaBlBlKeyCombination class >> mBuilder: aLookup [ 
	<typShaMethod: 'builder'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlKeyCombinationBuilder typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombination class >> shadowedClass [
	^ BlKeyCombination class
]
