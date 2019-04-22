Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypCachingMethodResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #initialization }
TypPraMethodResolver >> selector [
	^ #typPraMethodResolverIndex
]
