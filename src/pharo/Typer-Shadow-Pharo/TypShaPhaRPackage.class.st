Class {
	#name : #TypShaPhaRPackage,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRPackage class >> shadowedClass [
	^ RPackage class
]

{ #category : #accessing }
TypShaPhaRPackage >> ___definedClasses [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> Class typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRPackage >> ___methods [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> CompiledMethod typAsType)} asDictionary ];
		yourself
]
