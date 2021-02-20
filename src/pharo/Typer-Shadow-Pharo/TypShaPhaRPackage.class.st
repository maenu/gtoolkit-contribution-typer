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
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' -> Class typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRPackage >> ___methods [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' -> CompiledMethod typAsType)} asDictionary ];
		yourself
]
