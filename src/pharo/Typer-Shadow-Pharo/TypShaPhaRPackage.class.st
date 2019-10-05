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
				copyWithBindings: {('@A' typAsType -> Class typAsType)} typAsTypeVariableBindings ];
		yourself
]

{ #category : #accessing }
TypShaPhaRPackage >> ___methods [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' typAsType -> CompiledMethod typAsType)} typAsTypeVariableBindings ];
		yourself
]
