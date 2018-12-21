Class {
	#name : #TypShaPhaSmalltalkImage,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSmalltalkImage class >> shadowedClass [
	^ SmalltalkImage class
]

{ #category : #accessing }
TypShaPhaSmalltalkImage >> ___globals [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SystemDictionary typAsType
				asParametricType:
					{String typAsType.
					Class typAsType} ];
		yourself
]
